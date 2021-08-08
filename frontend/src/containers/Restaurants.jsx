import React, { Fragment, useEffect, useReducer } from "react";
import styled from "styled-components";
import { Link } from "react-router-dom";

// components
import Skeleton from "@material-ui/lab/Skeleton";

// reducers
import { initialState, restaurantsActionTypes, restaurantsReducer } from "../reducers/restaurants";

// constants
import { REQUEST_STATE } from "../constants";

// apis
import { fetchRestaurants } from "../apis/restaurants";

// images
import MainLogo from "../images/logo.png";
import MainCoverImage from "../images/main-cover-image.png";
import RestaurantImage from "../images/restaurant-image.jpg";

const HeaderWrapper = styled.div`
  display: flex;
  justify-content: flex-start;
  padding: 8px 32px;
`;

const MainLogoImage = styled.img`
  height: 90px;
`;

const MainCoverImageWrapper = styled.div`
  text-align: center;
  max-width: 1000px;
  margin: 0 auto;
`;

const MainCover = styled.img`
  width: 100%;
`;

// --- ここから追加 ---
const RestaurantsContentsList = styled.div`
  display: flex;
  justify-content: space-around;
  align-items: center;
  flex-wrap: wrap;
  margin-bottom: 150px;
  padding: 48px;
`;

const RestaurantsContentWrapper = styled.div`
  width: 320px;
  height: 350px;
  padding: 10px;
  margin-bottom: 10px;
`;

const RestaurantsImageNode = styled.img`
  width: 100%;
`;

const MainText = styled.p`
  color: black;
  font-size: 18px;
`;

const SubText = styled.p`
  color: black;
  font-size: 12px;
`;

export const Restaurants = () => {
  const [state, dispatch] = useReducer(restaurantsReducer, initialState);

  useEffect(() => {
    dispatch({ type: restaurantsActionTypes.FETCHING });
    fetchRestaurants().then((data) =>
      dispatch({
        type: restaurantsActionTypes.FETCH_SUCCESS,
        payload: {
          restaurants: data.restaurants,
        },
      })
    );
  }, []);

  return (
    <Fragment>
      <HeaderWrapper>
        <MainLogoImage src={MainLogo} alt="main logo" />
      </HeaderWrapper>
      <MainCoverImageWrapper>
        <MainCover src={MainCoverImage} alt="main cover" />
      </MainCoverImageWrapper>
      <RestaurantsContentsList>
        {state.fetchState === REQUEST_STATE.LOADING ? (
          <Fragment>
            {[...Array(5).keys()].map((i) => (
              <Skeleton key={i} variant="rect" width={350} height={360} />
            ))}
          </Fragment>
        ) : (
          state.restaurantsList.map((item, index) => (
            <Link to={`/restaurants/${item.id}/foods`} key={index} style={{ textDecoration: "none" }}>
              <RestaurantsContentWrapper>
                <RestaurantsImageNode src={RestaurantImage} />
                <MainText>{item.name}</MainText>
                <SubText>{`配送料：${item.fee}円 ${item.time_required}分`}</SubText>
              </RestaurantsContentWrapper>
            </Link>
          ))
        )}
      </RestaurantsContentsList>
    </Fragment>
  );
};
