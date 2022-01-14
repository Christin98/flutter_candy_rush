import 'package:flutter/material.dart';

abstract class BlocBase {
  void dispose();
}

class BlocProvider<T extends BlocBase> extends StatefulWidget {
  const BlocProvider({
    Key? key,
    required this.child,
    required this.bloc,
}): super(key: key);

  final Widget child;
  final T bloc;

  @override
  _BlocProviderState<T> createState() => _BlocProviderState<T>();

  static T? of<T extends BlocBase>(BuildContext context){
    var provider = context.findAncestorWidgetOfExactType<_BlocProviderInherited<T>>();
    _BlocProviderInherited<T>? widget = provider;
    return widget?.bloc;
  }

}

class _BlocProviderState<T extends BlocBase> extends State<BlocProvider<T>> {
  @override
  void dispose() {
    widget.bloc.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return _BlocProviderInherited<T>(
      bloc: widget.bloc,
      child: widget.child,
    );
  }
}

class _BlocProviderInherited<T> extends InheritedWidget {
  const _BlocProviderInherited({
    Key? key,
    required Widget child,
    required this.bloc,
}) : super(key: key, child: child);

  final T bloc;

  @override
  bool updateShouldNotify(_BlocProviderInherited oldWidget) => true;
}

typedef BlocProvider _BuildWithChild(Widget child);

Widget blocsTree(
List<_BuildWithChild> childlessBlocs, {
  required Widget child,
}) {
  return childlessBlocs.reversed.fold<Widget>(child, (
      Widget nextChild, _BuildWithChild childlessBloc) => childlessBloc(nextChild),
  );
}

_BuildWithChild blocTreeNode<T extends BlocBase>(T bloc) =>
    (Widget child) => BlocProvider(child: child, bloc: bloc);