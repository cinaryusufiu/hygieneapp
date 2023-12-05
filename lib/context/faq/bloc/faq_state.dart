part of 'faq_bloc.dart';

enum FaqStatus { initial, loading, success, failure }

final class FaqState extends Equatable {
  final FaqStatus status;
  final List<Faq> faqs;

  const FaqState({
    this.status = FaqStatus.initial,
    this.faqs = const [],
  });

  FaqState copyWith({
    FaqStatus? status,
    List<Faq>? faqs,
  }) {
    return FaqState(
      status: status ?? this.status,
      faqs: faqs ?? this.faqs,
    );
  }

  @override
  List<Object?> get props => [status, faqs];
}
