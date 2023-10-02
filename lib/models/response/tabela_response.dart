class TabelaResponse {
  final String nazivKluba;
  final int brojBodova;

  TabelaResponse({
    required this.nazivKluba,
    required this.brojBodova,
  });

  factory TabelaResponse.fromJson(Map<String, dynamic> json) {
    return TabelaResponse(
      nazivKluba: json['nazivKluba'],
      brojBodova: json['brojBodova'],
    );
  }
}
