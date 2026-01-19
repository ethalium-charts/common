{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Mixin to convert a multidimensional map into a singledimensional dot-notation map

    ------ USAGE ------
    {{ include "common.mixins.dotify" $dict }}

    ------ OUTPUT ------
    foo.bar: "value"
    
    -----------------------------------------------------------------------------------
*/}}
{{- define "common.mixins.dotify" }}
    {{- include "common.mixins.__dotify" (dict "map" . "prefix" "") }}
{{- end }}



{{- define "common.mixins.__dotify" }}
    {{- $out := dict -}}
    {{- $map := .map -}}
    {{- $prefix := .prefix | default "" -}}

    {{- range $key, $value := $map -}}
        {{- $fullKey := $key -}}
        {{- if ne $prefix "" -}}
            {{- $fullKey = printf "%s.%s" $prefix $key -}}
        {{- end -}}

        {{- if kindIs "map" $value -}}
            {{- $nested := include "mixins._flatten-map" (dict "map" $value "prefix" $fullKey) | fromYaml -}}
            {{- range $nk, $nv := $nested -}}
                {{- $_ := set $out $nk $nv -}}
            {{- end -}}
        {{- else if kindIs "slice" $value -}}
            {{- $_ := set $out $fullKey ($value | toJson) -}}
        {{- else -}}
            {{- $_ := set $out $fullKey $value -}}
        {{- end -}}
    {{- end -}}

    {{- toYaml $out -}}
{{- end }}