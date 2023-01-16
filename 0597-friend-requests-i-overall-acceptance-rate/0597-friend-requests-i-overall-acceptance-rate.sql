
With AcceptedRequests as(
    Select count(*) as count1 from(
    Select distinct requester_id,accepter_id
    from RequestAccepted) SQ4
),
TotalRequests as(
    Select count(*) as count1 from(
    Select distinct sender_id,send_to_id
    from FriendRequest) SQ5
)
Select isnull(Max(accept_rate),0) as accept_rate from
(Select convert(decimal(10,2),cast((Select count1 from AcceptedRequests) as float)/ nullif((Select count1 from TotalRequests),0)) as accept_rate) ST1

