{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Returns true if the detected platform is OpenShift by checking if a specific apiVersion exists

    ------ USAGE ------
    {{ include "common.compatibility.isOpenShift" . }}

    -----------------------------------------------------------------------------------
*/}}
{{- define "common.compatibility.isOpenShift" }}
    {{- if .Capabilities.APIVersions.Has "security.openshift.io/v1" }}
        {{- true }}
    {{- end }}
{{- end }}
