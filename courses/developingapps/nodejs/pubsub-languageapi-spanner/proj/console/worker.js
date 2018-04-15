// Copyright 2017, Google, Inc.
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

// TODO: Load the ../server/gcp/pubsub module

const subscriber = require('../server/gcp/pubsub');

// END TODO

// TODO: Load the ../server/gcp/languageapi module

const languageAPI = require('../server/gcp/languageapi');

// END TODO

// TODO: Load the ../server/gcp/spanner module

const feedbackStorage = require('../server/gcp/spanner');

// END TODO



console.log('Worker starting...');

// The callback function - invoked when a message arrives
function handler(message) {
    console.log('Message received');
    // TODO: Log the message to the console

    console.log(message);


    // END TODO

    // TODO: Invoke the languageapi module method
    // with the feedback from the student
    languageAPI.analyze(message.data.feedback)
      .then(score => {
      	
      // TODO: Log sentiment score
      console.log(`Score: ${score}`);

      // END TODO

    // TODO: Add a score property to feedback object

      message.data.score = score;

    // END TODO

    // TODO: Pass on the feedback object
    // to next Promise handler
  	  return message.data;
  	}).then(feedbackStorage.saveFeedback)

    // END TODO

    // TODO: Add third .then(...)
    .then(() => {

    // TODO Log feedback saved message
		console.log('Feedback saved');

    // END TODO

  });
}

// TODO: Register the callback with the module

subscriber.registerFeedbackNotification(handler);

// END TODO
