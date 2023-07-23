// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_product_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$singleProductStateHash() =>
    r'96f5cc94b6f5ba52e110beb5824db15f71a27e41';

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

abstract class _$SingleProductState
    extends BuildlessAutoDisposeAsyncNotifier<SingleProduct?> {
  late final String id;

  FutureOr<SingleProduct?> build(
    String id,
  );
}

/// See also [SingleProductState].
@ProviderFor(SingleProductState)
const singleProductStateProvider = SingleProductStateFamily();

/// See also [SingleProductState].
class SingleProductStateFamily extends Family<AsyncValue<SingleProduct?>> {
  /// See also [SingleProductState].
  const SingleProductStateFamily();

  /// See also [SingleProductState].
  SingleProductStateProvider call(
    String id,
  ) {
    return SingleProductStateProvider(
      id,
    );
  }

  @override
  SingleProductStateProvider getProviderOverride(
    covariant SingleProductStateProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'singleProductStateProvider';
}

/// See also [SingleProductState].
class SingleProductStateProvider extends AutoDisposeAsyncNotifierProviderImpl<
    SingleProductState, SingleProduct?> {
  /// See also [SingleProductState].
  SingleProductStateProvider(
    this.id,
  ) : super.internal(
          () => SingleProductState()..id = id,
          from: singleProductStateProvider,
          name: r'singleProductStateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$singleProductStateHash,
          dependencies: SingleProductStateFamily._dependencies,
          allTransitiveDependencies:
              SingleProductStateFamily._allTransitiveDependencies,
        );

  final String id;

  @override
  bool operator ==(Object other) {
    return other is SingleProductStateProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<SingleProduct?> runNotifierBuild(
    covariant SingleProductState notifier,
  ) {
    return notifier.build(
      id,
    );
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
