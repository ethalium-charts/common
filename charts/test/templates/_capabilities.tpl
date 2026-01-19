{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Returns the kubeVersion. Can be overridden by .Values.kubeVersion OR .Values.global.kubeVersion

    ------ ORDER ------
    - .Values.global.kubeVersion
    - .Values.kubeVersion
    - .Capabilities.KubeVersion.Version

    ------ USAGE ------
    {{ include "common.capabilities.kubeVersion" . }}

    -----------------------------------------------------------------------------------
*/}}
{{- define "common.capabilities.kubeVersion" }}
    {{- default (default .Capabilities.KubeVersion.Version .Values.kubeVersion) .Values.global.kubeVersion }}
{{- end }}
