// Four divisions of three drivers. A season races each rival on both division tracks.
export class League {
 constructor(config,state=null) {
  this.config=config;
  if(state?.version===2){Object.assign(this,structuredClone(state));this.config=config;}
  else {this.version=2;this.division=4;this.race=0;this.season=1;this.roster=[['YOU',0,1],[2,3,4],[5,6,7],[8,9,10]];this.points={};this.rounds=[];this.message='NEW SEASON';this.superLeague=false;}
 }
 name(id){return id==='YOU'?'YOU':this.config.driverNames[id].toUpperCase();}
 get members(){return this.roster[4-this.division];}
 get opponents(){return this.members.filter(id=>id!=='YOU');}
 get opponent(){return this.opponents[[0,1,1,0][this.race]];}
 get track(){return this.config.divisionTracks[4-this.division][this.race%2];}
 get standings(){return this.members.map(id=>({id,name:this.name(id),points:this.points[id]||0})).sort((a,b)=>b.points-a.points);}
 add(id,points){this.points[id]=(this.points[id]||0)+points;}
 record(win,bestLap) {
  const opponent=this.opponent;this.add(win?'YOU':opponent,2);this.add(bestLap?'YOU':opponent,1);
  this.rounds.push({opponent,track:this.track,win,bestLap});this.race++;
  // The other two drivers also meet on each track; skill determines their simulated result.
  if(this.race%2===0){const [a,b]=this.opponents,flip=(this.season+this.race)%3===0;this.add(flip?a:b,2);this.add(flip?b:a,1);}
  this.message='RACE STANDINGS';
  if(this.race===4){const standings=this.standings,pos=standings.findIndex(r=>r.id==='YOU');this.lastStandings=standings;this.lastDivision=this.division;
   if(pos===0&&this.division>1){const current=this.members,upper=this.roster[5-this.division],swap=upper[0];upper[0]='YOU';current[current.indexOf('YOU')]=swap;this.division--;this.message='PROMOTED TO DIVISION '+this.division;}
   else if(pos===0&&this.division===1){this.superLeague=true;this.message='SUPER LEAGUE UNLOCKED';}
   else if(pos===2&&this.division<4){const current=this.members,lower=this.roster[3-this.division],swap=lower.at(-1);lower[lower.length-1]='YOU';current[current.indexOf('YOU')]=swap;this.division++;this.message='RELEGATED TO DIVISION '+this.division;}
   else this.message='SEASON COMPLETE';
   this.season++;this.race=0;this.points={};this.rounds=[];
  }else this.lastStandings=null;
 }
 serialize(){const {config,...state}=this;return state;}
}
