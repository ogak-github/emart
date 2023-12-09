// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$allProductsHash() => r'8372559e19b86aa7edf132e8ec81181445f6b38e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [allProducts].
@ProviderFor(allProducts)
const allProductsProvider = AllProductsFamily();

/// See also [allProducts].
class AllProductsFamily extends Family<AsyncValue<List<Product>>> {
  /// See also [allProducts].
  const AllProductsFamily();

  /// See also [allProducts].
  AllProductsProvider call({
    int? limit,
    String? sort,
  }) {
    return AllProductsProvider(
      limit: limit,
      sort: sort,
    );
  }

  @override
  AllProductsProvider getProviderOverride(
    covariant AllProductsProvider provider,
  ) {
    return call(
      limit: provider.limit,
      sort: provider.sort,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'allProductsProvider';
}

/// See also [allProducts].
class AllProductsProvider extends FutureProvider<List<Product>> {
  /// See also [allProducts].
  AllProductsProvider({
    int? limit,
    String? sort,
  }) : this._internal(
          (ref) => allProducts(
            ref as AllProductsRef,
            limit: limit,
            sort: sort,
          ),
          from: allProductsProvider,
          name: r'allProductsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$allProductsHash,
          dependencies: AllProductsFamily._dependencies,
          allTransitiveDependencies:
              AllProductsFamily._allTransitiveDependencies,
          limit: limit,
          sort: sort,
        );

  AllProductsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.limit,
    required this.sort,
  }) : super.internal();

  final int? limit;
  final String? sort;

  @override
  Override overrideWith(
    FutureOr<List<Product>> Function(AllProductsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AllProductsProvider._internal(
        (ref) => create(ref as AllProductsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        limit: limit,
        sort: sort,
      ),
    );
  }

  @override
  FutureProviderElement<List<Product>> createElement() {
    return _AllProductsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AllProductsProvider &&
        other.limit == limit &&
        other.sort == sort;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, limit.hashCode);
    hash = _SystemHash.combine(hash, sort.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AllProductsRef on FutureProviderRef<List<Product>> {
  /// The parameter `limit` of this provider.
  int? get limit;

  /// The parameter `sort` of this provider.
  String? get sort;
}

class _AllProductsProviderElement extends FutureProviderElement<List<Product>>
    with AllProductsRef {
  _AllProductsProviderElement(super.provider);

  @override
  int? get limit => (origin as AllProductsProvider).limit;
  @override
  String? get sort => (origin as AllProductsProvider).sort;
}

String _$getCategoriesHash() => r'7ee93a13fd8ffe9226ce4aca9c7d7bb91b807054';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider = FutureProvider<List<String>>.internal(
  getCategories,
  name: r'getCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$getCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GetCategoriesRef = FutureProviderRef<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
