{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Mixin to create a name for a resource.
    The provided name will be truncated at 63 chars, because some Kubernetes name fields are limited to this (by the DNS naming spec).

    ------ USAGE ------
    {{ include "common.mixins.create-name" "<name>" }}
    {{ include "common.mixins.create-name" (list "<part>" "<part>") }}
    
    -----------------------------------------------------------------------------------
*/}}
{{- define "common.mixins.create-name" }}
    {{- if kindIs "slice" . }}
        {{- (join "-" .) | trunc 63 | trimSuffix "-" }}
    {{- else if kindIs "string" .}}
        {{- . | trunc 63 | trimSuffix "-" }}
    {{- end }}
{{- end }}