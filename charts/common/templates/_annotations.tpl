{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Returns the common annotations that have been defined. Merges the labels from:
    - .Values.global.commonAnnotations
    - .Values.commonAnnotations

    ------ USAGE ------
    {{ include "common.annotations" . }}

    -----------------------------------------------------------------------------------
*/}}
{{- define "common.annotations" }}
    {{- $commonAnnotationsGlobal := (default dict .Values.global.commonAnnotations) }}
    {{- $commonAnnotations := (default dict .Values.commonAnnotations) }}

    {{- ((include "common.mixins.merge-map" (list $commonAnnotationsGlobal $commonAnnotations))) }}
{{- end }}