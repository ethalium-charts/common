{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Mixin to generate a checksum from a template.

    ------ USAGE ------
    {{ include "common.mixins.template.checksum" (list . "/configmap.yaml") }}

    ------ OUTPUT ------
    <sha512>
    
    -----------------------------------------------------------------------------------
*/}}
{{- define "common.mixins.template.checksum" }}
    {{- $root := index . 0 }}
    {{- $template := index . 1 }}
    {{- include (print $root.Template.BasePath $template) $root | sha256sum }}
{{- end }}



{{/*
    -----------------------------------------------------------------------------------

    ------ DESCRIPTION ------
    Mixin to generate a checksum from a template.

    ------ USAGE ------
    {{ include "common.mixins.template.checksum.map" (list . "/configmap.yaml") }}

    ------ OUTPUT ------
    checksum/<path>: <sha256>
    
    -----------------------------------------------------------------------------------
*/}}
{{- define "common.mixins.template.checksum.map" }}
    {{- $root := index . 0 }}
    {{- $template := index . 1 }}
    {{- (dict (join "" (list "helm.sh/checksum" ($template | replace "/" "_" | replace "." "-"))) (include "common.mixins.template.checksum" .)) | toYaml }}
{{- end }}