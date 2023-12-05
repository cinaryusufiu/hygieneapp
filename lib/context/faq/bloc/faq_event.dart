part of 'faq_bloc.dart';

sealed class FaqEvent extends Equatable {
  const FaqEvent();

  @override
  List<Object> get props => [];
}

final class FaqGetItemsRequested extends FaqEvent {
  const FaqGetItemsRequested();
}

final class FaqSelectedItem extends FaqEvent {
  const FaqSelectedItem({
    required this.faq,
    required this.isSelected,
  });

  final Faq faq;
  final bool isSelected;

  @override
  List<Object> get props => [faq, isSelected];
}
