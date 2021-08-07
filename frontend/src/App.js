import React from "react";
import "./App.css";
import { BrowserRouter as Router, Switch, Route } from "react-router-dom";

// components
import { Restaurants } from "./containers/Restaurants.jsx";
import { Foods } from "./containers/Foods.jsx";
import { Orders } from "./containers/Orders.jsx";

function App() {
  return (
    //まずはRouterで全体を囲む
    <Router>
      <h1>メインページ</h1>
      {/*  ルーティングさせたいコンポーネントをSwitchで囲む */}
      <Switch>
        {/* Routeで囲って実際に１ページへのルーティングを指定 exactでPATHの完全一致の場合にのみコンポーネントをレンダリング */}
        <Route exact path="/restaurants">
          <Restaurants />
        </Route>
        <Route exact path="/foods">
          <Foods />
        </Route>
        <Route exact path="/orders">
          <Orders />
        </Route>

        <Route exact path="/restaurants/:restaurantsId/foods" render={({ match }) => <Foods match={match} />} />
      </Switch>
    </Router>
  );
}

export default App;
