# Copyright 2017 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM alpine:3.13

WORKDIR /opt/resource

RUN apk update --no-cache && apk add git openssh-client
ADD build/gerrit-resource .
RUN chmod +x gerrit-resource && \
	ln -s gerrit-resource check && \
	ln -s gerrit-resource in && \
	ln -s gerrit-resource out

RUN mkdir /root/.ssh
COPY ssh_config /root/.ssh/config
RUN chown root:root /root/.ssh/config && \
	chmod 600 /root/.ssh/config