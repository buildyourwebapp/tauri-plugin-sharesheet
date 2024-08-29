// Copyright 2019-2023 Tauri Programme within The Commons Conservancy
// SPDX-License-Identifier: Apache-2.0
// SPDX-License-Identifier: MIT

use serde::Serialize;

#[derive(Debug, Default, Serialize)]
#[serde(rename_all = "camelCase")]
pub struct SharesheetOptions {
  pub mime_type: Option<String>,
}

#[derive(Serialize)]
pub struct SharesheetPayload {
  pub text: String,
  #[serde(flatten)]
  pub options: SharesheetOptions,
}
