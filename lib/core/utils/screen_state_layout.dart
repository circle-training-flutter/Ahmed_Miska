import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';

class ScreenStateLayout extends StatelessWidget {
  final bool _isEmpty;
  final bool _isLoading;
  final bool _isError;
  final String? _error;
  final WidgetBuilder? _errorBuilder;
  final WidgetBuilder? _loadingBuilder;
  // final VoidCallback? _onRetry;
  final WidgetBuilder _builder;

  const ScreenStateLayout({
    Key? key,
    required WidgetBuilder builder,
    bool isEmpty = false,
    bool isError = false,
    String? error,
    bool isLoading = false,
    WidgetBuilder? errorBuilder,
    WidgetBuilder? loadingBuilder,
    VoidCallback? onRetry,
  })  : _isEmpty = isEmpty,
        _isError = isError,
        _isLoading = isLoading,
        _error = error,
        _errorBuilder = errorBuilder,
        _loadingBuilder = loadingBuilder,
        _builder = builder,
        //      _onRetry = onRetry,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildView(context);
  }

  Widget _buildView(BuildContext context) {
    if (_isLoading) {
      return _loadingBuilder != null ? _loadingBuilder(context) : const Center(child: CircularProgressIndicator());
    } else if (_isError) {
      return _errorBuilder != null ? _errorBuilder(context) : CustomErrorWidget(errMessage: _error!);
    } else if (_isEmpty) {
      return const NoDataScreen();
    } else {
      return _builder(context);
    }
  }
}

class NoDataScreen extends StatelessWidget {
  const NoDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('No Data Found', style: TextStyles.font18MadaSemiBoldBlack),
    );
  }
}
