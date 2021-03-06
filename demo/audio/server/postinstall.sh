#!/bin/bash
# Copyright 2018 Google LLC. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# =============================================================================

whereami=`pwd`
mkdir -p dist/client
cd ../../../src/server
yarn publish-local
cd $whereami
yalc link federated-learning-server
if [ -e ../client ]
then
  cd ../client
  yarn build
  cp dist/* ../server/dist/client
  cd $whereami
fi
