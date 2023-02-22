import 'package:book_app/feature/domain/entities/book_model.dart';
import 'package:book_app/feature/domain/use_case/get_action_use_case.dart';
import 'package:book_app/feature/domain/use_case/get_details_use_case.dart';
import 'package:book_app/feature/domain/use_case/get_fictions_use_case.dart';
import 'package:book_app/feature/domain/use_case/get_horros_use_case.dart';
import 'package:book_app/feature/domain/use_case/get_novels_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'books_state.dart';
part 'books_event.dart';
part 'books_bloc.freezed.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState>{
  final GetActionUseCase getActionUseCase;
  final GetFictionUseCase getFictionUseCase;
  final GetHorrorUseCase getHorrorUseCase;
  final GetNovelUseCase getNovelUseCase;
  final GetDetailsUseCase getDetailsUseCase;

  BooksBloc(
      this.getDetailsUseCase,
      this.getNovelUseCase,
      this.getHorrorUseCase,
      this.getFictionUseCase,
      this.getActionUseCase
      ) : super(const BooksState.initial()) {
    on<FictionBooksEvent>(_getFictions);
    on<NovelBooksEvent>(_getNovels);
    on<ActionBooksEvent>(_getActions);
    on<HorrorBooksEvent>(_getHorrors);
    on<DetailsBooksEvent>(_getDetails);
  }

  Future _getFictions(FictionBooksEvent event, Emitter<BooksState> emit) async{
    emit(const BooksState.loading());
    final result = await getFictionUseCase();
    result.fold(
            (l) => emit(BooksState.error(error: l.toString())),
            (r) => emit(BooksState.loaded(books: r))
    );
  }

  Future _getNovels(NovelBooksEvent event, Emitter<BooksState> emit) async{
    emit(const BooksState.loading());

    final result = await getNovelUseCase();
    result.fold(
            (l) => emit(BooksState.error(error: l.toString())),
            (r) => emit(BooksState.loaded(books: r))
    );

  }

  Future _getActions(ActionBooksEvent event, Emitter<BooksState> emit) async{
    emit(const BooksState.loading());
    final result = await getActionUseCase();
    result.fold(
            (l) => emit(BooksState.error(error: l.toString())),
            (r) => emit(BooksState.loaded(books: r))
    );
  }

  Future _getHorrors(HorrorBooksEvent event, Emitter<BooksState> emit) async{
    emit(const BooksState.loading());
    final result = await getHorrorUseCase();
    result.fold(
            (l) => emit(BooksState.error(error: l.toString())),
            (r) => emit(BooksState.loaded(books: r))
    );
  }

  Future _getDetails(DetailsBooksEvent event, Emitter<BooksState> emit) async {
    emit(const BooksState.loading());
    final result = await getDetailsUseCase(event.id);
    result.fold(
            (l) => emit(BooksState.error(error: l.toString())),
            (r) => emit(BooksState.loaded(items: r))
    );
  }
}