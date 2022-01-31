// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grupo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Grupo _$GrupoFromJson(Map<String, dynamic> json) {
  return Grupo(
    codEmpresa: json['codEmpresa'] as int,
    codGrupo: json['codGrupo'] as int,
    nomeGrupo: json['nomeGrupo'] as String,
  );
}

Map<String, dynamic> _$GrupoToJson(Grupo instance) => <String, dynamic>{
      'codEmpresa': instance.codEmpresa,
      'codGrupo': instance.codGrupo,
      'nomeGrupo': instance.nomeGrupo,
    };
