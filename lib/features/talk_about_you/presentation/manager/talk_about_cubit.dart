import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'talk_about_state.dart';

class TalkAboutCubit extends Cubit<TalkAboutState> {
  TalkAboutCubit() : super(TalkAboutInitial());

  TalkAboutCubit get(context) => BlocProvider.of(context);

  int play= 0;

  void playIcon(){
    if(play == 0){
        play= 1;
       emit(PlayIconChange());
    }else{
       play = 0;
       emit(PlayIconChange());
    }

  }

}
