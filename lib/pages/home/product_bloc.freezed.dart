// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(String? query) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(String? query)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(String? query)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadData value) loadData,
    required TResult Function(_search value) search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadData value)? loadData,
    TResult? Function(_search value)? search,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadData value)? loadData,
    TResult Function(_search value)? search,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductEventCopyWith<$Res> {
  factory $ProductEventCopyWith(
          ProductEvent value, $Res Function(ProductEvent) then) =
      _$ProductEventCopyWithImpl<$Res, ProductEvent>;
}

/// @nodoc
class _$ProductEventCopyWithImpl<$Res, $Val extends ProductEvent>
    implements $ProductEventCopyWith<$Res> {
  _$ProductEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_loadDataCopyWith<$Res> {
  factory _$$_loadDataCopyWith(
          _$_loadData value, $Res Function(_$_loadData) then) =
      __$$_loadDataCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_loadDataCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$_loadData>
    implements _$$_loadDataCopyWith<$Res> {
  __$$_loadDataCopyWithImpl(
      _$_loadData _value, $Res Function(_$_loadData) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_loadData implements _loadData {
  _$_loadData();

  @override
  String toString() {
    return 'ProductEvent.loadData()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_loadData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(String? query) search,
  }) {
    return loadData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(String? query)? search,
  }) {
    return loadData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(String? query)? search,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadData value) loadData,
    required TResult Function(_search value) search,
  }) {
    return loadData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadData value)? loadData,
    TResult? Function(_search value)? search,
  }) {
    return loadData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadData value)? loadData,
    TResult Function(_search value)? search,
    required TResult orElse(),
  }) {
    if (loadData != null) {
      return loadData(this);
    }
    return orElse();
  }
}

abstract class _loadData implements ProductEvent {
  factory _loadData() = _$_loadData;
}

/// @nodoc
abstract class _$$_searchCopyWith<$Res> {
  factory _$$_searchCopyWith(_$_search value, $Res Function(_$_search) then) =
      __$$_searchCopyWithImpl<$Res>;
  @useResult
  $Res call({String? query});
}

/// @nodoc
class __$$_searchCopyWithImpl<$Res>
    extends _$ProductEventCopyWithImpl<$Res, _$_search>
    implements _$$_searchCopyWith<$Res> {
  __$$_searchCopyWithImpl(_$_search _value, $Res Function(_$_search) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = freezed,
  }) {
    return _then(_$_search(
      query: freezed == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_search implements _search {
  _$_search({this.query = null});

  @override
  @JsonKey()
  final String? query;

  @override
  String toString() {
    return 'ProductEvent.search(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_search &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_searchCopyWith<_$_search> get copyWith =>
      __$$_searchCopyWithImpl<_$_search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loadData,
    required TResult Function(String? query) search,
  }) {
    return search(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loadData,
    TResult? Function(String? query)? search,
  }) {
    return search?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loadData,
    TResult Function(String? query)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadData value) loadData,
    required TResult Function(_search value) search,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadData value)? loadData,
    TResult? Function(_search value)? search,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadData value)? loadData,
    TResult Function(_search value)? search,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class _search implements ProductEvent {
  factory _search({final String? query}) = _$_search;

  String? get query;
  @JsonKey(ignore: true)
  _$$_searchCopyWith<_$_search> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProductState {
  String get message => throw _privateConstructorUsedError;
  EnumStatus get status => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  List<Product> get products => throw _privateConstructorUsedError;
  List<String> get categoryNames => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message,
            EnumStatus status,
            List<Category> categories,
            List<Product> products,
            List<String> categoryNames)
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String message,
            EnumStatus status,
            List<Category> categories,
            List<Product> products,
            List<String> categoryNames)?
        state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String message,
            EnumStatus status,
            List<Category> categories,
            List<Product> products,
            List<String> categoryNames)?
        state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_state value) state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_state value)? state,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_state value)? state,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductStateCopyWith<ProductState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductStateCopyWith<$Res> {
  factory $ProductStateCopyWith(
          ProductState value, $Res Function(ProductState) then) =
      _$ProductStateCopyWithImpl<$Res, ProductState>;
  @useResult
  $Res call(
      {String message,
      EnumStatus status,
      List<Category> categories,
      List<Product> products,
      List<String> categoryNames});
}

/// @nodoc
class _$ProductStateCopyWithImpl<$Res, $Val extends ProductState>
    implements $ProductStateCopyWith<$Res> {
  _$ProductStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
    Object? categories = null,
    Object? products = null,
    Object? categoryNames = null,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnumStatus,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      categoryNames: null == categoryNames
          ? _value.categoryNames
          : categoryNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_stateCopyWith<$Res> implements $ProductStateCopyWith<$Res> {
  factory _$$_stateCopyWith(_$_state value, $Res Function(_$_state) then) =
      __$$_stateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String message,
      EnumStatus status,
      List<Category> categories,
      List<Product> products,
      List<String> categoryNames});
}

/// @nodoc
class __$$_stateCopyWithImpl<$Res>
    extends _$ProductStateCopyWithImpl<$Res, _$_state>
    implements _$$_stateCopyWith<$Res> {
  __$$_stateCopyWithImpl(_$_state _value, $Res Function(_$_state) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? status = null,
    Object? categories = null,
    Object? products = null,
    Object? categoryNames = null,
  }) {
    return _then(_$_state(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as EnumStatus,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<Product>,
      categoryNames: null == categoryNames
          ? _value._categoryNames
          : categoryNames // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_state implements _state {
  _$_state(
      {this.message = '',
      this.status = EnumStatus.initial,
      final List<Category> categories = const [],
      final List<Product> products = const [],
      final List<String> categoryNames = const []})
      : _categories = categories,
        _products = products,
        _categoryNames = categoryNames;

  @override
  @JsonKey()
  final String message;
  @override
  @JsonKey()
  final EnumStatus status;
  final List<Category> _categories;
  @override
  @JsonKey()
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<Product> _products;
  @override
  @JsonKey()
  List<Product> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  final List<String> _categoryNames;
  @override
  @JsonKey()
  List<String> get categoryNames {
    if (_categoryNames is EqualUnmodifiableListView) return _categoryNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoryNames);
  }

  @override
  String toString() {
    return 'ProductState.state(message: $message, status: $status, categories: $categories, products: $products, categoryNames: $categoryNames)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_state &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            const DeepCollectionEquality()
                .equals(other._categoryNames, _categoryNames));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      message,
      status,
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_products),
      const DeepCollectionEquality().hash(_categoryNames));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_stateCopyWith<_$_state> get copyWith =>
      __$$_stateCopyWithImpl<_$_state>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String message,
            EnumStatus status,
            List<Category> categories,
            List<Product> products,
            List<String> categoryNames)
        state,
  }) {
    return state(message, status, categories, products, categoryNames);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String message,
            EnumStatus status,
            List<Category> categories,
            List<Product> products,
            List<String> categoryNames)?
        state,
  }) {
    return state?.call(message, status, categories, products, categoryNames);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String message,
            EnumStatus status,
            List<Category> categories,
            List<Product> products,
            List<String> categoryNames)?
        state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(message, status, categories, products, categoryNames);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_state value) state,
  }) {
    return state(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_state value)? state,
  }) {
    return state?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_state value)? state,
    required TResult orElse(),
  }) {
    if (state != null) {
      return state(this);
    }
    return orElse();
  }
}

abstract class _state implements ProductState {
  factory _state(
      {final String message,
      final EnumStatus status,
      final List<Category> categories,
      final List<Product> products,
      final List<String> categoryNames}) = _$_state;

  @override
  String get message;
  @override
  EnumStatus get status;
  @override
  List<Category> get categories;
  @override
  List<Product> get products;
  @override
  List<String> get categoryNames;
  @override
  @JsonKey(ignore: true)
  _$$_stateCopyWith<_$_state> get copyWith =>
      throw _privateConstructorUsedError;
}
