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
const config = require('../config');

// TODO: Load the Cloud Pub/Sub module

const Pubsub = require('@google-cloud/pubsub');

// END TODO

// TODO: Create a client object against Cloud Pub/Sub
// The Pubsub(...) factory function accepts an options 
// object which is used to specify which project's Cloud 
// Pub/Sub topics should be used via the projectId 
// property. 
// The projectId is retrieved from the config module. 
// This module retrieves the project ID from the 
// GCLOUD_PROJECT environment variable.

const pubsub = Pubsub({
  projectId: config.get('GCLOUD_PROJECT')
});

// END TODO

// TODO: Get a reference to the feedback topic
// This code assumes that the topic is already present in 
// the project. 
// If it isn't then you would need to handle that case by 
// using the pubsub object's createTopic(...) method

const topic = pubsub.topic('feedback');

// END TODO


function publishFeedback(feedback) {
  // TODO: Publish a message to the feedback topic
  // This runs asynchronously so you need to return the 
  // Promise that results from executing topic.publish(...)
  // In addition, it's a good idea to use a consistent 
  // property for the message body. This lab will use the 
  // name data for the message data

    return topic.publish({
      data: feedback
    });

  // END TODO

}

// The worker application will pass a callback to this 
// method as the cb argument so it is notified when 
// feedback is received
function registerFeedbackNotification(cb) {
  // TODO: Create a subscription called worker-subscription
  // TODO: Have it auto-acknowledge messages

  topic.subscribe('worker-subscription', { autoAck: true })
    .then(results => {

  // The results argument in the callback is an array - the 
  // first element in this array is the subscription object.

  // TODO: Declare a subscription constant

  const subscription = results[0];

  // END TODO

  // TODO: Register an event handler for message event
  // TODO: Use an arrow function to handle the event
  subscription.on('message', message => {

  // TODO: When a message arrives, invoke a callback
    cb(message.data);

  // END TODO
  });

  // TODO: Register an event handler for error event
  subscription.on('error', err => {

  // TODO: Print the error to the console
    console.error(err);

  });

  });

}

// [START exports]
module.exports = {
  publishFeedback,
  registerFeedbackNotification
};
// [END exports]
