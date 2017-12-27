<team-modal>
  <virtual if={ team }>
    <div class="ui page dimmer active" onclick={ hideModal }></div>
    <div class="ui tiny modal active">
      <i class="close icon" onclick={ hideModal }></i>
      <div class="header">
        <i class="icon user"></i>
        参加者情報の編集
      </div>
      <div class="content">
        <div class="ui form grid">
          <div class="sixteen wide column">
            <input name="name" type="text" class="ui fluid small input" value={ team.name } placeholder="参加者名" onchange={ updateTeam }>
          </div>

          <div class="nine wide column" if={ team.name!='' }>
            <input name="group" type="text" class="ui fluid input" value={ team.group } placeholder="所属など" onchange={ updateTeam } disabled={ team.name=='' }>
          </div>

          <div class="seven wide column" if={ team.name!='' }>
            <div class="ui icon button { disabled: team.name=='' }" onclick={ selectCountry }>
              <i class="icon globe" ></i>
            </div>
            <span if={ team.country }>
              <i class="flag { team.country }" if={ team.country }></i>
              ({ team.country })
            </span>
            <small if={ !team.country }>国旗を選択</small>
            <i class="icon link grey remove circle" if={ team.country } onclick={ removeCountry }></i>
          </div>

          <div class="sixteen wide column" if={ team.name!='' }>
            <input name="url" type="url" class="ui fluid input" value={ team.url } placeholder="URL" onchange={ updateTeam } disabled={ team.name=='' }>
          </div>
        </div>
      </div>

      <div class="actions">
        <div class="ui primary left floated small button" onclick={ saveChanges }>
          更新
        </div>
        <div class="ui basic left floated small button" onclick={ hideModal }>
          キャンセル
        </div>
        <div class="ui right icon red basic small button" onclick={ removeTeam }>
          <i class="icon trash"></i>
          削除
        </div>
      </div>
    </div>
    <country-select ref="country_select" tournament={ tournament }></coutry-select>
  </virtual>


  <style>
    .ui.tiny.modal { top: 10%; }
    @media only screen and (min-width: 1200px) {
      .ui.tiny.modal {
        width: 450px;
        margin: 0 0 0 -225px;
      }
    }
    .ui.tiny.modal .grid { margin: 0; }
  </style>


  <script>
    /***********************************************
    * Variables
    ***********************************************/
    var that = this
    that.mixin('tournamentMixin')
    that.tournament = opts.tournament


    /***********************************************
    * Observables
    ***********************************************/
    obs.on("teamModalChanged", function(teamIndex) {
      that.teamIndex = teamIndex
      that.team = that.tournament.teams[teamIndex]
      that.update()
    })

    obs.on("countrySelected", function(country) {
      that.team.country = country
      that.update()
    })


    /***********************************************
    * Functions
    ***********************************************/
    hideModal() {
      that.team = null
      that.update()
    }

    removeTeam() {
      that.team = {name: ''}
      that.saveChanges()
    }

    removeCountry() {
      that.team.country = null
    }

    saveChanges() {
      that.tournament.teams[that.teamIndex] = that.team
      if(that.team.name=='') {
        that.tournament = that.updateByeGames(that.tournament)
      }
      that.team = null
      obs.trigger("tournamentChanged", that.tournament)
    }

    selectCountry(e) {
      var countrySelect = that.refs.country_select
      countrySelect.showModal()
    }

    updateTeam(e) {
      var attribute = e.currentTarget.getAttribute('name')
      that.team[attribute] = e.currentTarget.value
      that.update()
    }
  </script>
</team-modal>
