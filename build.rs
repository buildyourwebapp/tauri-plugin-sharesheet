// Copyright 2019-2023 Tauri Programme within The Commons Conservancy
// SPDX-License-Identifier: Apache-2.0
// SPDX-License-Identifier: MIT

const COMMANDS: &[&str] = &["share_text"];

fn main() {
    tauri_plugin::Builder::new(COMMANDS)
        .global_api_script_path("./api-iife.js")
        .android_path("android")
        .ios_path("ios")
        .build();

    #[cfg(target_os = "macos")]
    {
        tauri_plugin::mobile::update_entitlements(|entitlements| {
            entitlements.insert(
                "com.apple.developer.group-session".into(),
                true.into()
            );
        })
        .expect("failed to update entitlements");
    }
}
