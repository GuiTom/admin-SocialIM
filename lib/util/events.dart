import 'package:dog/dog.dart';
import 'package:flutter/foundation.dart';

import 'life_state.dart';

typedef ObjectCallback(String type, Object data);

class Events {
  Map<String, ObserverList<ObjectCallback>>? _data = {};

  void addListener(String type, ObjectCallback listener) {
    if (_data != null) {
      if (!_data!.containsKey(type)) {
        _data![type] = ObserverList<ObjectCallback>();
      }
      _data![type]!.add(listener);
    } else {
      dog.d("addListener error $type");
    }
  }

  void observe(LifeStateOwner owner, String type, ObjectCallback listener) {
    owner.addObserver((owner, state) {
      if (state == LifeState.initialized) {
        addListener(type, listener);
      } else if (state == LifeState.disposed) {
        removeListener(type, listener);
      }
    });
  }

  void observeList(LifeStateOwner owner, List<String> types,
      ObjectCallback listener) {
    owner.addObserver((owner, state) {
      if (state == LifeState.initialized) {
        addListeners(types, listener);
      } else if (state == LifeState.disposed) {
        removeListeners(types, listener);
      }
    });
  }

  void addListeners(List<String> types, ObjectCallback listener) {
    types.forEach((String type) {
      addListener(type, listener);
    });
  }

  void removeListener(String type, ObjectCallback listener) {
    if (_data != null) {
      if (_data!.containsKey(type)) {
        _data![type]!.remove(listener);
      }
      if (_data![type] != null && _data![type]!.length == 0) {
        _data!.remove(type);
      }
    } else {
      dog.d("removeListener error $type");
    }
  }

  void removeListeners(List<String> types, ObjectCallback listener) {
    types.forEach((String type) {
      removeListener(type, listener);
    });
  }

  @mustCallSuper
  void dispose() {
    _data = null;
  }

  void emit(String type, [Object data = '']) {
    if (_data != null && _data!.containsKey(type)) {
      ObserverList<ObjectCallback> _listeners = _data![type]!;
      final List<ObjectCallback> localListeners =
      List<ObjectCallback>.from(_listeners);
      for (ObjectCallback listener in localListeners) {
        try {
          if (_listeners.contains(listener)) {
            listener(type, data);
          }
        } catch (exception, stack) {
          FlutterError.reportError(FlutterErrorDetails(
            exception: exception,
            stack: stack,
            library: 'events library',
          ));
        }
      }
    }
  }
}

Events eventCenter = Events();
