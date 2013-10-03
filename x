onDjAdvance: function(data) {
            if ((this.settings.notify & 17) === 17)
                appendChatMessage(this.i18n('notify.message.stats',data.lastPlay.score.positive,data.lastPlay.score.negative,data.lastPlay.score.curates),this.settings.colors.stats);
            if ((this.settings.notify & 33) === 33)
                appendChatMessage(this.i18n('notify.message.updates',data.media.title,data.media.author,Utils.cleanTypedString(data.dj.username)),this.settings.colors.updates);
            setTimeout($.proxy(this.onDjAdvanceLate,this),Math.randomRange(1,10)*1000);
            if (API.hasPermission(undefined, API.ROLE.BOUNCER) || isPlugCubedDeveloper(API.getUser().id)) this.onHistoryCheck(data.media.id)
            var obj = {
                id : data.media.id,
                author : data.media.author,
                title : data.media.title,
                wasSkipped : false,
                user : {
                    id : data.dj.id,
                    username : data.dj.username
