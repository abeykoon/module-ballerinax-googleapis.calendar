import ballerina/log;
import ballerinax/googleapis.calendar;

configurable string clientId = ?;
configurable string clientSecret = ?;
configurable string refreshToken = ?;
configurable string refreshUrl = ?;
configurable string calendarId = ?;
configurable string address = ?;

public function main() returns error? {

    calendar:ConnectionConfig config = {
        auth: {
            clientId: clientId,
            clientSecret: clientSecret,
            refreshToken: refreshToken,
            refreshUrl: refreshUrl
        }
    };

    calendar:Client calendarClient = check new (config);

    calendar:WatchResponse|error res = calendarClient->watchEvents(calendarId, address);
    if (res is calendar:WatchResponse) {
        log:printInfo(res.id);
    } else {
        log:printError(res.message());
    }
}
