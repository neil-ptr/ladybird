/*
 * Copyright (c) 2024, Neil Viloria <neilcviloria@gmail.com>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include "LibWebView/InspectorClient.h"
#include <Cocoa/Cocoa.h>

@interface Settings : NSObject

+ (instancetype)the;
- (void)setInspectorPosition:(WebView::InspectorClient::Position)position;
- (WebView::InspectorClient::Position)inspectorPosition;

@end
