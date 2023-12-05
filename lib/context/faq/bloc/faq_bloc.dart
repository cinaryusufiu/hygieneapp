import 'package:equatable/equatable.dart';
import 'package:hygieneapp/context/faq/model/faq_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'faq_state.dart';
part 'faq_event.dart';

class FaqBloc extends Bloc<FaqEvent, FaqState> {
  final FaqsRepository _faqsRepository;
  FaqBloc({
    required FaqsRepository faqsRepository,
  })  : _faqsRepository = faqsRepository,
        super(const FaqState()) {
    on<FaqGetItemsRequested>(_onFaqGetItemsRequested);
  }

  Future<void> _onFaqGetItemsRequested(
    FaqGetItemsRequested event,
    Emitter<FaqState> emit,
  ) async {
    emit(state.copyWith(status: FaqStatus.loading));

    await emit.forEach<List<Faq>>(
      _faqsRepository.getFaqs(),
      onData: (faqs) => state.copyWith(
        status: FaqStatus.success,
        faqs: faqs,
      ),
      onError: (_, __) => state.copyWith(
        status: FaqStatus.failure,
      ),
    );
  }
}

final class FaqsRepository {
  FaqsRepository() {
    _init();
  }

  void _init() {
    _todoStreamController.add(faqs);
  }

  final List<Faq> faqs = [
    Faq(
        'HOW CAN I CHANGE MY SHIPPING ADDRESS?',
        'By default, the last used shipping address will be saved intoto your Sample Store account. When you are checkingout your order, the default shipping address will be displayedand you have the option to amend it if you need to.',
        false),
    Faq(
        'HOW MANY FREE SAMPLES CAN I REDEEM?',
        'Due to the limited quantity, each member`s account is only entitled to 1 unique free sample. You can check out up to 4 free samples in each checkout.',
        false),
    Faq(
        'HOW CAN I TRACK MY ORDERS & PAYMENT?',
        'By default, the last used shipping address will be saved intoto your Sample Store account. When you are checkingout your order, the default shipping address will be displayedand you have the option to amend it if you need to.',
        false),
    Faq(
        'HOW LONG WILL IT TAKE FOR MY ORDER TO ARRIVE AFTER I MAKE PAYMENT?',
        'By default, the last used shipping address will be saved intoto your Sample Store account. When you are checkingout your order, the default shipping address will be displayedand you have the option to amend it if you need to.',
        false),
    Faq(
        'HOW DO YOU SHIP MY ORDERS?',
        'By default, the last used shipping address will be saved intoto your Sample Store account. When you are checkingout your order, the default shipping address will be displayedand you have the option to amend it if you need to.',
        false),
    Faq(
        'HOW DO I MAKE PAYMENTS USING PAYPAL? HOW DOES IT WORK?',
        'By default, the last used shipping address will be saved intoto your Sample Store account. When you are checkingout your order, the default shipping address will be displayedand you have the option to amend it if you need to.',
        false)
  ];

  final _todoStreamController = BehaviorSubject<List<Faq>>.seeded(const []);

  Stream<List<Faq>> getFaqs() => _todoStreamController.asBroadcastStream();
}
