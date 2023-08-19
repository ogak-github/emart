// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartStateHash() => r'ef7a13ff96e4dfdfa776df2829d8ebc02f479fce';

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

abstract class _$CartState
    extends BuildlessAutoDisposeAsyncNotifier<List<Cart>> {
  late final String userId;

  Future<List<Cart>> build(
    String userId,
  );
}

/// See also [CartState].
@ProviderFor(CartState)
const cartStateProvider = CartStateFamily();

/// See also [CartState].
class CartStateFamily extends Family<AsyncValue<List<Cart>>> {
  /// See also [CartState].
  const CartStateFamily();

  /// See also [CartState].
  CartStateProvider call(
    String userId,
  ) {
    return CartStateProvider(
      userId,
    );
  }

  @override
  CartStateProvider getProviderOverride(
    covariant CartStateProvider provider,
  ) {
    return call(
      provider.userId,
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
  String? get name => r'cartStateProvider';
}

/// See also [CartState].
class CartStateProvider
    extends AutoDisposeAsyncNotifierProviderImpl<CartState, List<Cart>> {
  /// See also [CartState].
  CartStateProvider(
    this.userId,
  ) : super.internal(
          () => CartState()..userId = userId,
          from: cartStateProvider,
          name: r'cartStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cartStateHash,
          dependencies: CartStateFamily._dependencies,
          allTransitiveDependencies: CartStateFamily._allTransitiveDependencies,
        );

  final String userId;

  @override
  bool operator ==(Object other) {
    return other is CartStateProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<Cart>> runNotifierBuild(
    covariant CartState notifier,
  ) {
    return notifier.build(
      userId,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
