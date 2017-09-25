angular.module("sandManApp.branding", [], ["$provide", function($provide) {

    $provide.value("brandedText", {
        default: {
            mainImage: "static/branding/smart/images/smart-logo.png",
            mainImage2x: "static/branding/smart/images/smart-logo@2x.png",
            whiteImage: "static/branding/smart/images/smart-white-logo.png",
            whiteImage2x: "static/branding/smart/images/smart-white-logo@2x.png",
            mainTitle: "SMART Sandbox",
            sandboxText: "",
            moreLinks: false,
            dashboardTitle: "Dashboard",
            showEmptyInviteList: false,
            copyright: "© Harvard Medical School / Boston Children's Hospital / SMART Health IT, 2017",
            showCert: false,
            showTermsLink: false,
            userSettingsPWM: true,
            loginDoc: "http://docs.smarthealthit.org/sandbox/",
            defaultApiEndpointIndex : "1",
            defaultLaunchScenario: false,
            sandboxApiEndpointIndexes : [
                {index: "1", name: "FHIR DSTU 2 (v1.0.2)", fhirVersion: "1.0.2", fhirTag: "1_0_2", altName: "FHIR v1.0.2", canCreate: true, supportsDataSets: false},
                {index: "2", name: "FHIR STU 3 (v3.0.1)", fhirVersion: "3.0.1", fhirTag: "3_0_1", altName: "FHIR v3.0.1", canCreate: true, supportsDataSets: false}
            ],
            sandboxDescription: {
                title: "",
                description: "The SMART Health IT Sandbox is a virtual testing environment that mimics a live EHR production environment, but is populated with sample data that is reset on a nightly basis. Use it to test and demonstrate apps for practitioners and patients that use the SMART on FHIR platform to access clinical data.",
                bottomNote:"The Sandbox is provided by the SMART Health IT project as a free service to the healthcare app development community and is for testing purposes only. Do not store any information that contains personal health information or any other confidential information. This system should not be used in the provision of clinical care.",
                checkList: []
            },
            documentationLinks : [
                {name: "registerAnApp", link: "http://docs.smarthealthit.org/sandbox/register-app.html"},
                {name: "sandboxVersions", link: "http://hl7.org/fhir/directory.html"},
                {name: "launchScenarios", link: "http://docs.smarthealthit.org/sandbox/launch.html"},
                {name: "sandboxPersona", link: "http://docs.smarthealthit.org/sandbox/persona.html"},
                {name: "mainDocs", link: "http://docs.smarthealthit.org/"}
            ]
            }
    });
}]);