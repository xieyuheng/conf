var FindProxyForURL = function(init, profiles) {
    return function(url, host) {
        "use strict";
        var result = init, scheme = url.substr(0, url.indexOf(":"));
        do {
            result = profiles[result];
            if (typeof result === "function") result = result(url, host, scheme);
        } while (typeof result !== "string" || result.charCodeAt(0) === 43);
        return result;
    };
}("+auto switch", {
    "+auto switch": function(url, host, scheme) {
        "use strict";
        if (/^baidu\.com$/.test(host)) return "DIRECT";
        if (/(?:^|\.)google\.com$/.test(host)) return "+proxy";
        if (/^github\.com$/.test(host)) return "DIRECT";
        if (/^www\.wikiwand\.com$/.test(host)) return "+proxy";
        if (/^zh\.wikipedia\.org$/.test(host)) return "+proxy";
        if (/(?:^|\.)wikipedia\.org$/.test(host)) return "DIRECT";
        if (/(?:^|\.)google\./.test(host)) return "+proxy";
        if (/(?:^|\.)tmall\.com$/.test(host)) return "DIRECT";
        if (/(?:^|\.)bilibili\./.test(host)) return "DIRECT";
        if (/(?:^|\.)acfun\./.test(host)) return "DIRECT";
        if (/(?:^|\.)youku\./.test(host)) return "DIRECT";
        if (/(?:^|\.)163\.com$/.test(host)) return "DIRECT";
        if (/(?:^|\.)lagou\.com$/.test(host)) return "DIRECT";
        if (/(?:^|\.)taobao\.com$/.test(host)) return "DIRECT";
        if (/(?:^|\.)zhihu\./.test(host)) return "DIRECT";
        if (/(?:^|\.)oschina\.net$/.test(host)) return "DIRECT";
        if (/(?:^|\.)python\.org$/.test(host)) return "DIRECT";
        return "+proxy";
    },
    "+proxy": function(url, host, scheme) {
        "use strict";
        if (/^127\.0\.0\.1$/.test(host) || /^::1$/.test(host) || /^localhost$/.test(host)) return "DIRECT";
        return "SOCKS5 127.0.0.1:7001; SOCKS 127.0.0.1:7001";
    }
});