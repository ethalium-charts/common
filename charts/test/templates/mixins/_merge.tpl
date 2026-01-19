{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Mixin to merge multiple maps into one

    ------ USAGE ------
    {{ include "common.mixins.merge-map" (list $dict1 $dict2) }}

    -----------------------------------------------------------------------------------
*/}}
{{- define "common.mixins.merge-map" }}
    {{- $root := dict }}
    {{- with . }}
        {{- range . }}
            {{- if kindIs "map" . }}
                {{- $root = mustMerge $root (deepCopy .) }}
            {{- else if and (kindIs "string" .) (ne . "") }}
                {{- $root = mustMerge $root (deepCopy (. | fromYaml)) }}
            {{- end }}
        {{- end }}
    {{- end }}
    {{- $result := $root | toYaml }}
    {{- if and (ne $result "") (ne $result "{}") }}
        {{- $result }}
    {{- else }}
        {{- "" }}
    {{- end }}
{{- end }}
