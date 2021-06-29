//
// Copyright (C) 2021 Curity AB.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import AppAuth

struct ApplicationStateManager {
    
    static private var authState: OIDAuthState? = nil
    static private var metadataValue: OIDServiceConfiguration? = nil
    static var idToken: String? = nil
    
    static var metadata: OIDServiceConfiguration? {
        get {
            return self.metadataValue
        }
        set(value) {
            self.metadataValue = value
        }
    }
    
    static var registrationResponse: OIDRegistrationResponse? {
        get {
            return self.authState?.lastRegistrationResponse
        }
        set(value) {
            self.authState = OIDAuthState(registrationResponse: value!)
        }
    }
    
    static var tokenResponse: OIDTokenResponse? {
        get {
            return self.authState!.lastTokenResponse
        }
        set(value) {
            self.authState?.update(with: value, error: nil)
        }
    }
}
