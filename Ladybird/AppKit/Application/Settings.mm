/*
 * Copyright (c) 2024, Neil Viloria <neilcviloria@gmail.com>
 *
 * SPDX-License-Identifier: BSD-2-Clause
 */

#include "Settings.h"
#include "LibWebView/InspectorClient.h"
#include "Utilities/Conversions.h"

@implementation Settings

+ (instancetype)the
{
    static Settings* sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)setInspectorPosition:(WebView::InspectorClient::Position)position
{
    auto const position_string = WebView::InspectorClient::position_to_string(position);
    auto const position_ns_string = Ladybird::string_to_ns_string(position_string);
    [[NSUserDefaults standardUserDefaults] setValue:position_ns_string
                                             forKey:@"inspector_position"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (WebView::InspectorClient::Position)inspectorPosition
{
    NSString* position_ns_string = [[NSUserDefaults standardUserDefaults] valueForKey:@"inspector_position"];
    if (position_ns_string == nullptr)
        position_ns_string = @"RIGHT";

    auto const position_string = Ladybird::ns_string_to_string(position_ns_string);
    return WebView::InspectorClient::string_to_position(position_string);
}

@end
