#!/bin/bash

#
# Copyright 2020 The Project Oak Authors
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
#

# This script runs Cadence Conformal LEC in batch mode to compare the
# Silver Oak generated pinmux against the original pinmux RTL.

lec -xl -nogui -nobanner \
  -dofile  rtl_diff.do \
  -logfile rtl_diff.log \
  <<< "exit -force"

cd -
