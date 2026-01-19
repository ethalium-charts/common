{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Returns the name of the chart. If .Values.nameOverride is used, that name will be returned.

    ------ USAGE ------
    {{ include "common.name" . }}

    -----------------------------------------------------------------------------------
*/}}
{{- define "common.name" }}
    {{- $value := default .Chart.Name .Values.nameOverride }}
    {{- include "common.mixins.create-name" $value }}
{{- end }}



{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Create a default fully qualified app name.
    If the release name contains the chart name, it will be used as a fullname.

    ------ USAGE ------
    {{ include "common.fullname" . }}

    -----------------------------------------------------------------------------------
*/}}
{{- define "common.fullname" }}
    {{- $fullname := "" }}
    {{- if .Values.fullnameOverride }}
        {{- $fullname = .Values.fullnameOverride }}
    {{- else }}
        {{- $name := include "common.name" . }}
        {{- if contains $name .Release.Name }}
            {{- $fullname = .Release.Name }}
        {{- else }}
            {{- $fullname = list .Release.Name $name }}
        {{- end }}
    {{- end }}
    {{- include "common.mixins.create-name" $fullname }}
{{- end }}



{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Returns the namespace of the release. If .Values.namespaceOverride is used, that namespace will be returned.

    ------ USAGE ------
    {{ include "common.namespace" . }}

    -----------------------------------------------------------------------------------
*/}}
{{- define "common.namespace" }}
    {{- default .Release.Namespace .Values.namespaceOverride }}
{{- end }}



{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Returns the cluster domain. Will return "cluster.local" if .Values.clusterDomain is empty or not set.

    ------ USAGE ------
    {{ include "common.clusterDomain" . }}

    -----------------------------------------------------------------------------------
*/}}
{{- define "common.clusterDomain" }}
    {{- default "cluster.local" .Values.clusterDomain }}
{{- end }}