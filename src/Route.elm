module Route exposing (..)

import Http
import Navigation exposing (Location)
import Scuttlebutt.Client exposing (..)
import Types exposing (..)
import UrlParser as P exposing ((</>))


-- Helpers to turn Location into a Maybe Route


type Route
    = Blank
    | Settings


routeParser : P.Parser (Route -> a) a
routeParser =
    P.oneOf
        [ P.map Blank P.top
        , P.map Settings (P.s "settings")
        ]


parse : Location -> Maybe Route
parse location =
    P.parseHash routeParser location



-- Helper to turn Route into a url for the browser


toUrl : Route -> String
toUrl route =
    let
        hashPage =
            case route of
                Blank ->
                    "/"

                Settings ->
                    "/settings"
    in
    "#" ++ hashPage



-- helper to turn valid Page (with Data) into a Route


toRoute : Page -> Route
toRoute page =
    case page of
        SettingsPage ->
            Settings



-- helper to match Route to Page


isEqual : Route -> Page -> Bool
isEqual urlPage page =
    urlPage == toRoute page



{- helper to change browser bar to new url without adding to history
   for correcting invalid routes
   or for changing a url back to url for current page while data loads
-}


modifyUrl : Page -> Cmd msg
modifyUrl =
    Navigation.modifyUrl << toUrl << toRoute



-- helper to change browser bar to new url, adding to browser history


newUrl : Page -> Cmd msg
newUrl =
    Navigation.newUrl << toUrl << toRoute


fromUserId : String -> Cmd Msg
fromUserId user =
    let
        u =
            ProfilePageModel user "" "" "" []
    in
    newUrl <| ProfilePage u
