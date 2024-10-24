/*
 * Copyright (c) 2023, Tim Flynn <trflynn89@serenityos.org>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#pragma once

#include "LibWebView/InspectorClient.h"
#import <Cocoa/Cocoa.h>

@class LadybirdWebView;
@class Tab;

@interface Inspector : NSScrollView

- (instancetype)init:(Tab*)tab
            position:(WebView::InspectorClient::Position)position;

- (void)inspect;
- (void)reset;

- (void)selectHoveredElement;

- (void)setPosition:(WebView::InspectorClient::Position)position;

@property (nonatomic, strong) NSScrollView* inspector_scroll_view;
@property (nonatomic, strong) LadybirdWebView* web_view;

@end
