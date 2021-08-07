import React, { Fragment } from "react";

export const Foods = ({ match }) => {
  return (
    <Fragment>
      フード一覧
      <p>restaurantsIdをpropsで受け取った値:{match.params.restaurantsId}</p>
    </Fragment>
  );
};
