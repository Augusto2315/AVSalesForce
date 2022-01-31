import 'package:json_annotation/json_annotation.dart';
part 'grupo.g.dart';

@JsonSerializable()
class Grupo {
  int codEmpresa;
  int codGrupo;
  String nomeGrupo;

  Grupo(
      {required this.codEmpresa,
      required this.codGrupo,
      required this.nomeGrupo});

  factory Grupo.fromJson(Map<String, dynamic> json) => _$GrupoFromJson(json);
  Map<String, dynamic> toJson() => _$GrupoToJson(this);

  @override
  String toString() => nomeGrupo;
}
