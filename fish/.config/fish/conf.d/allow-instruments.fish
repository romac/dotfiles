function allow-inject -d "Allow an app to be injected with dylibs by codesigning it with the get-task-allow entitlement."
    if test (count $argv) != 1
        echo "Usage: allow-inject <path to app>"
        return
    end

    codesign -s - -v -f --entitlements (echo -n '<?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "https://www.apple.com/DTDs/PropertyList-1.0.dtd"\>
        <plist version="1.0">
            <dict>
                <key>com.apple.security.get-task-allow</key>
                <true/>
            </dict>
        </plist>' | psub) $argv[1]
end
