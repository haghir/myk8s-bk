{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "secret.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "secret.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "secret.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "secret.labels" -}}
helm.sh/chart: {{ include "secret.chart" . }}
{{ include "secret.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end -}}

{{/*
Selector labels
*/}}
{{- define "secret.selectorLabels" -}}
app.kubernetes.io/name: {{ include "secret.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "secret.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "secret.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Create the name of the home directory
*/}}
{{- define "secret.storages.home.name" -}}
{{- printf "%s-storage-home" (include "secret.fullname" .) -}}
{{- end -}}

{{/*
Create the name of the storage containing the secret data
*/}}
{{- define "secret.storages.data.name" -}}
{{- printf "%s-storage-data" (include "secret.fullname" .) -}}
{{- end -}}

{{/*
Create the name of the storage containing backups of the secret data (1)
*/}}
{{- define "secret.storages.backup1.name" -}}
{{- printf "%s-storage-backup1" (include "secret.fullname" .) -}}
{{- end -}}

{{/*
Create the name of the storage containing backups of the secret data (2)
*/}}
{{- define "secret.storages.backup2.name" -}}
{{- printf "%s-storage-backup2" (include "secret.fullname" .) -}}
{{- end -}}
