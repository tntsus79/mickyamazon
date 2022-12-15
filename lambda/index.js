/* *
 * This sample demonstrates handling intents from an Alexa skill using the Alexa Skills Kit SDK (v2).
 * Please visit https://alexa.design/cookbook for additional examples on implementing slots, dialog management,
 * session persistence, api calls, and more.
 * */
const Alexa = require('ask-sdk-core');
const express = require('express');
const{ ExpressAdapter } = require('ask-sdk-express-adapter');
const port = 3000 //Default port to http server
const mysql = require('mysql2');
const connection = mysql.createConnection({
    host: "bsu-gimm260-fall-2021.cwtgn0g8zxfm.us-west-2.rds.amazonaws.com",
    user: "MylesHolley",
    password: "UCK2sEht0Hry8vqIsa7nnODQ58f012KOCx7",
    database: 'MylesHolley'
});

const LaunchRequestHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'LaunchRequest';
    },
    handle(handlerInput) {
        const speakOutput = 'You started the game. What would you like to do?';

        return handlerInput.responseBuilder
            .speak(speakOutput)
            .reprompt(speakOutput)
            .getResponse();
    }
};

const CreateSheetIntentHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
            && Alexa.getIntentName(handlerInput.requestEnvelope) === 'SheetCreator';
    },
    handle(handlerInput) {
        const characterName = Alexa.getSlotValue(handlerInput.requestEnvelope, 'CharacterName');
        const characterClass = Alexa.getSlotValue(handlerInput.requestEnvelope, 'CharacterClass');
        const characterLevel = Alexa.getSlotValue(handlerInput.requestEnvelope, 'CharacterLevel');
        const characterRace = Alexa.getSlotValue(handlerInput.requestEnvelope, 'CharacterRace');
        const characterSubclass = Alexa.getSlotValue(handlerInput.requestEnvelope, 'CharacterSubClass');
        let insertSQL = `INSERT INTO alexa_character(character_name, character_class, character_race, character_level, character_subclass) VALUES (?,?,?,?,?);`
        let intentParams = [characterName,characterClass,characterRace,characterLevel,characterSubclass];
        let speakOutput = characterName + " " + characterLevel + " " + characterRace + " " + characterClass + " " + characterSubclass;
        connection.query(insertSQL,intentParams, (error)=> {
            if(error){
                speakOutput = 'Something wrong happened with the server.'
            }
            }); 
        


        return handlerInput.responseBuilder
            .speak(speakOutput)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const AccessSheetIntentHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
            && Alexa.getIntentName(handlerInput.requestEnvelope) === 'AccessSheet';
    },
    handle(handlerInput) {
        
        const characterName = Alexa.getSlotValue(handlerInput.requestEnvelope, 'AccessCharacter');
        let selectSQL = `SELECT character_name, 
                                character_class AS characterClass, 
                                character_race AS characterRace, 
                                character_level AS characterLevel, 
                                character_subclass AS characterSubclass 

                         FROM alexa_characters 
                         WHERE character_name = ?`
        let nameParam = [characterName]
        //const characterClass = character_class;
        // const characterRace = character_race;
        // const characterLevel = character_level;
        // const characterSubclass = character_subclass;               
        
        let speakOutput = characterClass;// + ' ' + characterClass + ' ' + characterRace + ' ' + characterLevel + ' ' + characterSubclass;
        connection.query(selectSQL, nameParam, (error)=> {
            if(error){
                speakOutput = 'Something wrong happened with the server.'
            }
            });

        return handlerInput.responseBuilder
            .speak(selectSQL)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const StatRollerIntentHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
            && Alexa.getIntentName(handlerInput.requestEnvelope) === 'StatRoller';
    },
    handle(handlerInput) {
        // let selectinnerjoin = `SELECT character_name 
        //                        FROM alexa_character 
        //                        INNER JOIN character_stats 
        //                        ON alexa_character.character_name = character_stats.character_name;`
        const name = Alexa.getSlotValue(handlerInput.requestEnvelope, 'Character');
        const strengthScore = Alexa.getSlotValue(handlerInput.requestEnvelope, 'Strength');
        const dexterityScore = Alexa.getSlotValue(handlerInput.requestEnvelope, 'Dexterity');
        const constitutionScore = Alexa.getSlotValue(handlerInput.requestEnvelope, 'Constitution');
        const intelligenceScore = Alexa.getSlotValue(handlerInput.requestEnvelope, 'Intelligence');
        const wisdomScore = Alexa.getSlotValue(handlerInput.requestEnvelope, 'Wisdom');        
        const charismaScore = Alexa.getSlotValue(handlerInput.requestEnvelope, 'Charisma'); 

        let insertStatsSQL = `INSERT INTO character_stats(character_name,strength_score, dexterity_score, constitution_score, intelligence_score, wisdom_score, charisma_score) VALUES (?,?,?,?,?,?,?);`

        let = intentparams = [name,strengthScore,dexterityScore,constitutionScore,intelligenceScore,wisdomScore,charismaScore]; 

        let speakOutput = name + " " + strengthScore + " " + dexterityScore + " " + constitutionScore + " " + intelligenceScore + " " + wisdomScore + " " + charismaScore;
        connection.query(insertStatsSQL, intentparams, (error)=> {
                    if(error){
                        speakOutput = 'Something wrong happened with the server.'
                    }
                    }); 
        
        
        
                return handlerInput.responseBuilder
                    .speak(speakOutput)
                    //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
                    .getResponse();
            }
};

const DiceRollerIntentHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
            && Alexa.getIntentName(handlerInput.requestEnvelope) === 'DiceRoller';
    },
    handle(handlerInput) {
    const diceMax = Alexa.getSlotValue(handlerInput.requestEnvelope, 'DiceRoll');

    // let diceOutput = getRandomInt(diceMax);
    // let speakOutput = toString(diceOutput);
    // function getRandomInt(max) {
    //     return Math.floor(Math.random() * max);  
    // }

    let speakOutput = diceMax;
    let insertSQL = `INSERT INTO dice_roll_tracker(dice_rolled,rolled_value) VALUES (?,?);`
    let intentParams = [diceMax,speakOutput];
    
    
    connection.query(insertSQL,intentParams, (error)=> {
        if(error){
            speakOutput = 'Something wrong happened with the server.'
        }
        }); 

        return handlerInput.responseBuilder
            .speak(speakOutput)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const HelloWorldIntentHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
            && Alexa.getIntentName(handlerInput.requestEnvelope) === 'HelloWorldIntent';
    },
    handle(handlerInput) {
        const speakOutput = 'Hello World!';

        return handlerInput.responseBuilder
            .speak(speakOutput)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};

const HelpIntentHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
            && Alexa.getIntentName(handlerInput.requestEnvelope) === 'AMAZON.HelpIntent';
    },
    handle(handlerInput) {
        const speakOutput = 'You can say hello to me! How can I help?';

        return handlerInput.responseBuilder
            .speak(speakOutput)
            .reprompt(speakOutput)
            .getResponse();
    }
};

const CancelAndStopIntentHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
            && (Alexa.getIntentName(handlerInput.requestEnvelope) === 'AMAZON.CancelIntent'
                || Alexa.getIntentName(handlerInput.requestEnvelope) === 'AMAZON.StopIntent');
    },
    handle(handlerInput) {
        const speakOutput = 'Goodbye!';

        return handlerInput.responseBuilder
            .speak(speakOutput)
            .getResponse();
    }
};
/* *
 * FallbackIntent triggers when a customer says something that doesn’t map to any intents in your skill
 * It must also be defined in the language model (if the locale supports it)
 * This handler can be safely added but will be ingnored in locales that do not support it yet 
 * */
const FallbackIntentHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest'
            && Alexa.getIntentName(handlerInput.requestEnvelope) === 'AMAZON.FallbackIntent';
    },
    handle(handlerInput) {
        const speakOutput = 'Sorry, I don\'t know about that. Please try again.';

        return handlerInput.responseBuilder
            .speak(speakOutput)
            .reprompt(speakOutput)
            .getResponse();
    }
};
/* *
 * SessionEndedRequest notifies that a session was ended. This handler will be triggered when a currently open 
 * session is closed for one of the following reasons: 1) The user says "exit" or "quit". 2) The user does not 
 * respond or says something that does not match an intent defined in your voice model. 3) An error occurs 
 * */
const SessionEndedRequestHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'SessionEndedRequest';
    },
    handle(handlerInput) {
        console.log(`~~~~ Session ended: ${JSON.stringify(handlerInput.requestEnvelope)}`);
        // Any cleanup logic goes here.
        return handlerInput.responseBuilder.getResponse(); // notice we send an empty response
    }
};
/* *
 * The intent reflector is used for interaction model testing and debugging.
 * It will simply repeat the intent the user said. You can create custom handlers for your intents 
 * by defining them above, then also adding them to the request handler chain below 
 * */
const IntentReflectorHandler = {
    canHandle(handlerInput) {
        return Alexa.getRequestType(handlerInput.requestEnvelope) === 'IntentRequest';
    },
    handle(handlerInput) {
        const intentName = Alexa.getIntentName(handlerInput.requestEnvelope);
        const speakOutput = `You just triggered ${intentName}`;

        return handlerInput.responseBuilder
            .speak(speakOutput)
            //.reprompt('add a reprompt if you want to keep the session open for the user to respond')
            .getResponse();
    }
};
/**
 * Generic error handling to capture any syntax or routing errors. If you receive an error
 * stating the request handler chain is not found, you have not implemented a handler for
 * the intent being invoked or included it in the skill builder below 
 * */
const ErrorHandler = {
    canHandle() {
        return true;
    },
    handle(handlerInput, error) {
        const speakOutput = 'Sorry, I had trouble doing what you asked. Please try again.';
        console.log(`~~~~ Error handled: ${JSON.stringify(error)}`);

        return handlerInput.responseBuilder
            .speak(speakOutput)
            .reprompt(speakOutput)
            .getResponse();
    }
};

/**
 * This handler acts as the entry point for your skill, routing all request and response
 * payloads to the handlers above. Make sure any new handlers or interceptors you've
 * defined are included below. The order matters - they're processed top to bottom 
 * */
const skill = Alexa.SkillBuilders.custom()
    .addRequestHandlers(
        CreateSheetIntentHandler,
        DiceRollerIntentHandler,
        StatRollerIntentHandler,
        AccessSheetIntentHandler,
        LaunchRequestHandler,
        HelloWorldIntentHandler,
        HelpIntentHandler,
        CancelAndStopIntentHandler,
        FallbackIntentHandler,
        SessionEndedRequestHandler,
        IntentReflectorHandler)
    .addErrorHandlers(
        ErrorHandler)
    .withCustomUserAgent('sample/hello-world/v1.2')
    .create();

    const adapter = new ExpressAdapter(skill, false, false);
    const app = express();

    app.post('/', adapter.getRequestHandlers());
    app.listen(3000);