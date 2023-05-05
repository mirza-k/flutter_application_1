import 'package:flutter_application_1/enums/dogadjaji_utakmice_enum.dart';
import 'package:flutter_application_1/enums/klub_enum.dart';

class DetaljiUtakmiceVM {
  String gosti;
  String domaci;
  String rezultat;
  List<DogadjajiUtakmiceVM> dogadjajiUtakmiceVM;

  DetaljiUtakmiceVM(this.gosti, this.domaci, this.rezultat, this.dogadjajiUtakmiceVM);
}

class DogadjajiUtakmiceVM {
  String fudbaler;
  String minuta;
  DogadjajiUtakmiceEnum dogadjajiUtakmiceEnum;
  KlubEnum klubEnum;

  DogadjajiUtakmiceVM(this.fudbaler, this.minuta, this.dogadjajiUtakmiceEnum, this.klubEnum);
}

class StatistikaVM{
  String posjed;
  String sutevi;
  String faulovi;
  String ofsajdi;

  StatistikaVM(this.posjed, this.sutevi, this.faulovi, this.ofsajdi);
}
