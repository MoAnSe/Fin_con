function getIndex(list, id) {
    for (var i = 0; i < list.length; i++ ) {
        if (list[i].id === id) {
            return i;
        }
    }

    return -1;
}

var profitApi = Vue.resource('/profit{/id}');
var lossApi = Vue.resource('/loss{/id}');

Vue.component('message-form', {
    props: ['messages', 'messageAttr'],
    data: function() {
        return {
            text: '',
            p_amount: '',
            id: ''
        }
    },
    watch: {
        messageAttr: function(newVal, oldVal) {
            this.text = newVal.text;
            this.id = newVal.id;
            this.p_amount = newVal.p_amount;
        }
    },
    template:
        '<div>' +
        '<input type="text" placeholder="Write message" v-model="text" />' +
        '<input type="text" placeholder="Profit amount" v-model="p_amount" />' +
        '<input type="button" value="Save" @click="save" />' +
        '</div>',
    methods: {
        save: function() {
            var message = {text: this.text, p_amount: this.p_amount};

            if (this.id) {
                profitApi.update({id: this.id}, message).then(result =>
                result.json().then(data => {
                    var index = getIndex(this.messages, data.id);
                this.messages.splice(index, 1, data);
                this.text = ''
                this.p_amount = ''
                this.id = ''
            })
            )
            } else {
                profitApi.save({}, message).then(result =>
                result.json().then(data => {
                    this.messages.push(data);
                this.text = ''
                this.p_amount = ''
            })
            )
            }
        }
    }
});
Vue.component('message-row', {
    props: ['message', 'editMethod', 'messages'],
    template: '<div  style="display: flex; justify-content: space-between;">' +
        '{{ message.creationDate }} <span style="word-break:break-all;">{{ message.text }}</span>'+
        '<b style="color: green;">{{ message.p_amount }}</b>' +
        '<span style="position: relative; right: 0">' +
        '<input type="button" value="Edit" @click="edit" />' +
        '<input type="button" value="X" @click="del" />' +
        '</span>' +
        '</div>',
    methods: {
        edit: function() {
            this.editMethod(this.message);
        },
        del: function() {
            profitApi.remove({id: this.message.id}).then(result => {
                if (result.ok) {
                this.messages.splice(this.messages.indexOf(this.message), 1)
            }
        })
        }
    }
});
Vue.component('messages-list', {
    props: ['messages'],
    data: function() {
        return {
            message: null
        }
    },
    template:
        '<div style="position: relative; width: 500px;">' +
        '<message-form :messages="messages" :messageAttr="message" />' +
        '<message-row style=" margin-top: 15px;" v-for="message in messages" :key="message.id" :message="message" ' +
        ':editMethod="editMethod" :messages="messages" />' +
        '</div>',

    methods: {
        editMethod: function(message) {
            this.message = message;
        }
    }
});
Vue.component('loss-message-form', {
    props: ['loss_messages', 'loss_messageAttr'],
    data: function() {
        return {
            text: '',
            l_amount: '',
            id: ''
        }
    },
    watch: {
        loss_messageAttr: function(newVal, oldVal) {
            this.text = newVal.text;
            this.id = newVal.id;
            this.l_amount = newVal.l_amount;
        }
    },
    template:
        '<div>' +
        '<input type="text" placeholder="Write message" v-model="text" />' +
        '<input type="text" placeholder="Loss amount" v-model="l_amount" />' +
        '<input type="button" value="Save" @click="lsave" />' +
        '</div>',
    methods: {
        lsave: function() {
            var lmessage = {text: this.text, l_amount: this.l_amount};

            if (this.id) {
                lossApi.update({id: this.id}, lmessage).then(result =>
                result.json().then(data => {
                    var index = getIndex(this.loss_messages, data.id);
                this.loss_messages.splice(index, 1, data);
                this.text = ''
                this.l_amount = ''
                this.id = ''
            })
            )
            } else {
                lossApi.save({}, lmessage).then(result =>
                result.json().then(data => {
                    this.loss_messages.push(data);
                this.text = ''
                this.l_amount = ''
            })
            )
            }
        }
    }
});
Vue.component('loss-message-row', {
    props: ['loss_message', 'editlMethod', 'loss_messages'],
    template: '<div style="display: flex; justify-content: space-between;">' +
        '{{ loss_message.creationDate }} <span style="word-break:break-all;">{{ loss_message.text }}</span>'+
        '<b style="color: red;">{{ loss_message.l_amount }}</b>' +
        '<span style="position: relative; right: 0;">' +
        '<input type="button" value="Edit" @click="ledit" />' +
        '<input type="button" value="X" @click="ldel" />' +
        '</span>' +
        '</div>',
    methods: {
        ledit: function() {
            this.editlMethod(this.loss_message);
        },
        ldel: function() {
            lossApi.remove({id: this.loss_message.id}).then(result => {
                if (result.ok) {
                this.loss_messages.splice(this.loss_messages.indexOf(this.loss_message), 1)
            }
        })
        }
    }
});
Vue.component('loss-messages-list', {
    props: ['loss_messages'],
    data: function() {
        return {
            loss_message: null
        }
    },
    template:
        '<div style="position: relative; width: 500px;  margin-left: 30px;">' +
        '<loss-message-form :loss_messages="loss_messages" :loss_messageAttr="loss_message" />' +
        '<loss-message-row style="padding-right: 10px; margin-top: 15px;" v-for="loss_message in loss_messages"'+
        ':key="loss_message.id" :loss_message="loss_message" ' +
        ':editlMethod="editlMethod" :loss_messages="loss_messages" />' +
        '</div>',

    methods: {
        editlMethod: function(loss_message) {
            this.loss_message = loss_message;
        }
    }
});

var app = new Vue({
    el: '#app',
    template:'<div>'+
        '<div v-if="!profile">Необходимо авторизоватся!<a href="/login">Google</a></div>'+
        '<div v-else >' +
        '<div style="padding: 10px;">{{profile.name}}&nbsp;<a href="/logout">Выйти</a></div>'+
        '<span style="display: flex;">'+
        '<messages-list :messages="messages"/>'+
        '<loss-messages-list :loss_messages="loss_messages"/>'+
        '</span>'+
        '</div>'+
        '</div>',
    data: {
        messages: frontendData.vprofit,
        loss_messages: frontendData.vloss,
        profile: frontendData.profile
    }});
