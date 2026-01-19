{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Returns the default set of labels that will be added to all resources

    ------ USAGE ------
    {{ include "common.labels.defaults" . }}

    -----------------------------------------------------------------------------------
*/}}
{{- define "common.labels.defaults" }}
app.kubernetes.io/name: {{ include "common.name" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/instance: {{ include "common.fullname" . }}
app.kubernetes.io/version: {{ .Chart.AppVersion }}
helm.sh/chart: {{ printf "%s-%s" (.Chart.Name) (.Chart.Version | replace "+" "_") }}
{{- end }}


{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Returns the common labels that have been defined. Merges the labels from:
    - @common.labels.defaults
    - .Values.global.commonLabels
    - .Values.commonLabels

    ------ USAGE ------
    {{ include "common.labels" . }}

    -----------------------------------------------------------------------------------
*/}}
{{- define "common.labels" }}
    {{- $defaults := (include "common.labels.defaults" .) }}
    {{- $commonLabelsGlobal := (default dict .Values.global.commonLabels) }}
    {{- $commonLabels := (default dict .Values.commonLabels) }}

    {{- ((include "common.mixins.merge-map" (list $defaults $commonLabelsGlobal $commonLabels))) }}
{{- end }}