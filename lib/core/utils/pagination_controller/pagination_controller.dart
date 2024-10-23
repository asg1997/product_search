import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/pagination_controller/pagination_state/pagination_state.dart';

class PaginationController<T> extends StateNotifier<PaginationState<T>> {
  PaginationController({
    required Future<List<T>> Function(
      T? lastItemInResult,
      int offset,
      int page,
    ) fetchNextItems,
    required int itemsPerBatch,
    List<T> items = const [],
    bool paginationEnabled = true,
    int initialPage = 0,
  })  : _itemsPerBatch = itemsPerBatch,
        _fetchNextItems = fetchNextItems,
        _items = items,
        _paginationEnabled = paginationEnabled,
        _page = initialPage,
        super(PaginationState.data(items)) {
    _init();
  }

  final Future<List<T>> Function(T? lastItemInResult, int offset, int page)
      _fetchNextItems;
  final int _itemsPerBatch;

  List<T> _items;
  List<T> get items => _items;

  Timer _timer = Timer(Duration.zero, () {});

  bool _noMoreItems = false;
  bool get noMoreItems => _noMoreItems;
  int _page;

  final bool _paginationEnabled;

  bool get isLoading =>
      state is LoadingPaginationState || state is OnGoingLoadingState;

  void _init() {
    if (_items.isEmpty) _fetchFirstBatch();
  }

  void _updateData(List<T> result) {
    if (!mounted) return;
    _noMoreItems = result.length < _itemsPerBatch;
    _page += 1;
    if (result.isNotEmpty) {
      _items = [..._items, ...result];
    }
    state = PaginationState.data(_items);
  }

  Future<void> _fetchFirstBatch() async {
    try {
      state = const PaginationState.loading();
      final result = _items.isEmpty
          ? await _fetchNextItems(null, 0, _page)
          : await _fetchNextItems(_items.last, _items.length, _page);
      _updateData(result);
    } catch (e, stk) {
      state = PaginationState.error(e, stk);
    }
  }

  Future<void> fetchNextBatch() async {
    if (!_paginationEnabled || _timer.isActive == true) return;
    if (state == PaginationState.onGoingLoading(_items)) return;

    _timer = Timer(const Duration(milliseconds: 500), () {});
    state = PaginationState.onGoingLoading(_items);
    try {
      final result = await _fetchNextItems(
        _items.lastOrNull,
        _items.length,
        _page,
      );
      _updateData(result);
    } catch (e, stk) {
      state = PaginationState.error(e, stk);
    }
  }

  void updateElementAtIndex(int index, T updatedElement) {
    List<T> copyWithNewItem() {
      final updatedItems = [...items];
      updatedItems[index] = updatedElement;
      return updatedItems;
    }

    state.maybeWhen<void>(
      data: (items) {
        _items = copyWithNewItem();
        state = PaginationState.data(_items);
        return;
      },
      onGoingLoading: (items) {
        _items = copyWithNewItem();
        state = PaginationState.onGoingLoading(_items);
        return;
      },
      orElse: () {
        return;
      },
    );
  }

  void pushElement(T element) {
    state.whenOrNull(
      data: (items) {
        _items = [element, ...items];
        state = PaginationState.data(_items);
        return;
      },
      onGoingLoading: (items) {
        _items = [element, ...items];
        state = PaginationState.onGoingLoading(_items);
        return;
      },
    );
  }

  void removeElementAt(int index) {
    state.whenOrNull(
      data: (items) {
        _items = [...items]..removeAt(index);
        state = PaginationState.data(_items);
        return;
      },
      onGoingLoading: (items) {
        _items = [...items]..removeAt(index);
        state = PaginationState.onGoingLoading(_items);
        return;
      },
    );

    if (_items.length <= 4) fetchNextBatch();
  }

  void removeWhere(bool Function(T e) test) {
    state.whenOrNull(
      data: (items) {
        _items = [...items]..removeWhere(test);
        state = PaginationState.data(_items);
        return;
      },
      onGoingLoading: (items) {
        _items = [...items]..removeWhere(test);
        state = PaginationState.onGoingLoading(_items);
        return;
      },
    );

    if (_items.length <= 4) {
      fetchNextBatch();
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
