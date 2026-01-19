# Ethalium Common Library Chart

A [Helm Library Chart](https://helm.sh/docs/topics/library_charts/#helm) for grouping common logic between Ethalium charts.


## TL;DR

```yaml
dependencies:
  - name: common
    version: x.x.x
    repository: http://charts.ethalium.eu
```

```bash
helm dependency update
```

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ include "common.fullname" . }}
  namespace: {{ include "common.namespace" }}
data:
  foo: "bar"
```

## Introduction

This chart provides a common template helpers which can be used to develop new charts using [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.23+
- Helm 3.8.0+

## Parameters

The following table lists the helpers available in the library which are scoped in different sections.

`COMING SOON`
