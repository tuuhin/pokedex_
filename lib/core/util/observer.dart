import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../main.dart';

class Observer extends ProviderObserver {
  @override
  void didAddProvider(
      ProviderBase provider, Object? value, ProviderContainer container) {
    super.didAddProvider(provider, value, container);
    logger.fine("adding");
    logger.shout(provider.name);
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    logger.fine("disposing");
    logger.shout(provider.name);
    super.didDisposeProvider(provider, container);
  }
}
